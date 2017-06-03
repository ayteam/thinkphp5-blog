<?php
namespace app\admin\controller;

use think\Request;
use think\Session;

class User extends Base
{

    protected $userModel;

    public function __construct(\app\admin\model\User $user)
    {
        $this->userModel = $user;
    }

    /**
     * @return \think\response\View
     */
    public function index()
    {
        $users = $this->userModel->search();
        $page = $users->render();
        $users = $users->toArray();
        return view('index',['users'=>$users,'page'=>$page]);
    }



    /**
     *  查看详情
     */
    public function info(){
        $request = Request::instance();
        $id = $request->param('id');

        $info = $this->userModel->queryForObject(array(['id','=',$id]));
        return view('info',['info'=>$info]);
    }


}
