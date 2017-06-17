<?php
namespace app\index\controller;

use Blog\MarkDownParser;
use think\Request;

class Comment extends Base
{

    protected $categoryModel;
    protected $commentModel;

    public function __construct(\app\index\model\Category $category,\app\index\model\Comment $comment)
    {
        parent::__construct();
        $this->categoryModel = $category;
        $this->commentModel = $comment;
    }

    /**
     * @return \think\response\View
     * get:
     */
    public function update(MarkDownParser $markDownParser )
    {
        $request = Request::instance();
        $data['content'] = $request->param('content');
        $data['article_id'] = $request->param('article_id');


        $data['html_content'] = $markDownParser->parse($request->param('content'));
        if(session('?user')){
            $user = session('user');
            $data['user_id'] = $user['id'];
            $data['user_name'] = $user['user_name'];
            $data['email'] = $user['email'];
        }else{
            $data['user_name'] = $request->param('user_name');
            $data['email'] = $request->param('email');
        }
        $row = $this->commentModel->addObject($data);
        if($row >0){
            return json(['status' => 200, 'msg' => 'success']);
        }
        return json(['status' => 500, 'msg' => 'failed']);
    }

    public function index(){
        $request = Request::instance();
        $articleId = $request->param('id');
        //查询文章评论
        $comments = $this->commentModel->searchByArticleId($articleId);
       // return json($comments);
        return view('index',['comments'=>$comments]);
    }
}
