<?php
namespace app\index\controller;

use think\Request;
use think\Session;

class User
{

    protected $user;

    public function __construct(\app\index\model\User $user)
    {
        $this->user = $user;
    }

    /**
     * @return \think\response\View
     */
    public function index()
    {
        $request = Request::instance();
        $id = $request->param('id');
        $user = $this->user->queryForObject(array(['id','=',$id]));
        return view('index',['member'=>$user]);
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
        $row = $this->user->updateObject(array(['id','=',$user['id']]),$data);
        if($row>=0){
            return json(['status'=>1]);
        }
        return json(['status'=>2]);

    }


}
