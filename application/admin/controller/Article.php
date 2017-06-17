<?php
namespace app\admin\controller;

use app\admin\model\Category;
use app\admin\model\Tag;
use Blog\MarkDownParser;
use think\Request;
use think\Session;
use think\Validate;

class Article extends Base
{

    protected $articleModel;
    protected $categoryModel;
    protected $tagModel;

    public function __construct(\app\admin\model\Article $article,Category $category,Tag $tag)
    {
        $this->articleModel = $article;
        $this->tagModel = $tag;
        $this->categoryModel = $category;
    }

    /**
     * @return \think\response\View
     */
    public function index()
    {
        $request = Request::instance();
        $articles = $this->articleModel->search();
        $page = $articles->render();
        $articles = $articles->toArray();
        return view('index',['articles'=>$articles,'page'=>$page]);
    }

    /**
     * 写作页面
     * @return \think\response\View
     */
    public function add(){
        $categorys = $this->categoryModel->queryForList();
        $tags = $this->tagModel->queryForList();

        return view('add',['categorys'=>$categorys,'tags'=>$tags]);
    }

    /**
     *  保存写作
     */
    public function doAdd(MarkDownParser $markDownParser)
    {
        $request = Request::instance();
        $validate = new Validate([
            'title|标题'  => 'require|max:25',
            'description|描述' => 'require',
            'category_id|分类' => 'require',
            'tag_id|标签' => 'require',
            'content|内容' => 'require',
        ]);
       $tags = $request->param('tags/a');
        $data = [
            'title'  => $request->param('title'),
            'description'  => $request->param('description'),
            'category_id'  => $request->param('category_id'),
            'tag_id'  => isset($tags) ? implode(',',$tags) : '',
            'content'  => $request->param('content'),
        ];
        if (!$validate->check($data)) {
            cache('error',$validate->getError(),3);
            return $this->redirect('/admin/article/add');
        }
        $data['html_content'] = $markDownParser->parse($request->param('content'));
        $row = $this->articleModel->addObject($data);
        if($row>0){
            cache('success',$request->param('title').'创建成功！',3);
            return $this->redirect('/admin/article/index');
        }
        cache('error','稍后再试！',3);
        return $this->redirect('/admin/article/add');
    }

    /**
     *  修改页面
     */
    public function edit()
    {
        $request = Request::instance();
        $id = $request->param('id');
        $article = $this->articleModel->queryForObject(array(['id','=',$id]));
        $categorys = $this->categoryModel->queryForList();
        $tags = $this->tagModel->queryForList();
        $articleTags = $this->tagModel->queryForList(array(['id','in',$article['tag_id']]));
        return view('edit',['categorys'=>$categorys,'tags'=>$tags,'article'=>$article,'articleTags'=>$articleTags]);
    }

    /**
     *  修改操作
     */
    public function doEdit(MarkDownParser $markDownParser)
    {
        $request = Request::instance();
        $id = $request->param('id');
        $validate = new Validate([
            'title|标题'  => 'require|max:25',
            'description|描述' => 'require',
            'category_id|分类' => 'require',
            'tag_id|标签' => 'require',
            'content|内容' => 'require',
        ]);
        $tags = $request->param('tags/a');
        $data = [
            'title'  => $request->param('title'),
            'description'  => $request->param('description'),
            'category_id'  => $request->param('category_id'),
            'tag_id'  => isset($tags) ? implode(',',$tags) : '',
            'content'  => $request->param('content'),
        ];
        if (!$validate->check($data)) {
            cache('error',$validate->getError(),3);
            return $this->redirect('/admin/article/edit/'.$id);
        }
        $data['html_content'] = $markDownParser->parse($request->param('content'));
        $row = $this->articleModel->updateObject(array(['id','=',$id]),$data);
        if($row>=0){
            cache('success',$request->param('title').'修改成功！',3);
            return $this->redirect('/admin/article/index');
        }
        cache('error','稍后再试！',3);
        return $this->redirect('/admin/article/edit/'.$id);
    }

    /**
     *  启用/禁用
     * @return \think\response\Json
     */
    public function isOpen()
    {
        $request = Request::instance();
        $id = $request->param('id');
        $data['status'] = $request->param('status');
        $row = $this->articleModel->updateObject(array(['id','=',$id]),$data);
        if($row>0){
            return json(['status'=>1]);
        }
        return json(['status'=>2]);
    }

    public function download()
    {
        $request = Request::instance();
        $id = $request->param('id');
        $article = $this->articleModel->searchById($id);

        $articleTags = $this->tagModel->queryForList(array(['id','in',$article['tag_id']]));
        $info = "title: " . $article['title'];
        $info = $info . "\ndate: " . $article['create_at'];
        $info = $info . "\ncategory: " . $article['category_name'];
        $info = $info . "\ntags:\n";

        foreach ($articleTags as $tag) {
            $info = $info . "- $tag[tag_name]\n";
        }
        $info = $info . "---\n\n" . $article['content'];

        return response($info, 200,
            [
                "Content-Type" => 'application/force-download',
                'Content-Disposition' => "attachment; filename=\"" . $article['title'] . ".md\""
            ]
        );

    }


}
