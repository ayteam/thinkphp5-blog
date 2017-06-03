<?php
namespace app\admin\controller;

use think\Request;
use think\Session;

class Comment extends Base
{

    protected $commentModel;

    public function __construct(\app\admin\model\Comment $comment)
    {
        $this->commentModel = $comment;
    }

    /**
     * @return \think\response\View
     */
    public function index()
    {
        $comments = $this->commentModel->search();
        $page = $comments->render();
        $comments = $comments->toArray();
        return view('index',['comments'=>$comments,'page'=>$page]);
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
        $row = $this->commentModel->updateObject(array(['id','=',$id]),$data);
       if($row>0){
           return json(['status'=>1]);
       }
        return json(['status'=>2]);
    }


}
