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
//        dump($articles);die;

        return view('index',['articles'=>$articles,'page'=>$page]);
    }

    /**
     * 写作
     * @return \think\response\View
     */
    public function create(){
        $categorys = $this->categoryModel->queryForList();
        $tags = $this->tagModel->queryForList();

        return view('create',['categorys'=>$categorys,'tags'=>$tags]);
    }

    /**
     *  保存
     */
    public function add(MarkDownParser $markDownParser)
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
            return json(['status'=>2,'msg'=>$validate->getError()]);
        }
        $data['html_content'] = $markDownParser->parse($request->param('content'));
        $row = $this->articleModel->addObject($data);
        if($row>0){
            return json(['status'=>1,'msg'=>'发表成功']);
        }
        return json(['status'=>2,'msg'=>'稍后再试']);

    }

    /**
     *  修改
     */
    public function update(){
        $request = Request::instance();
        $user = Session::get('user');
        $data['user_name'] = $request->param('user_name');
        $data['website'] = $request->param('website');
        $data['description'] = $request->param('description');
        $data['weibo'] = $request->param('weibo');
        $data['github'] = $request->param('github');
        $row = $this->articleModel->updateObject(array(['id','=',$user['id']]),$data);
        if($row>=0){
            return json(['status'=>1]);
        }
        return json(['status'=>2]);

    }


}
