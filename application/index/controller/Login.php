<?php
namespace app\index\controller;

use app\index\model\User;
use think\Cookie;
use think\Request;
use think\Session;

class Login
{

    protected $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * @return \think\response\View
     */
    public function index()
    {
        return view('index');
    }

    /**
     * 登陆
     * @return void
     */
    public function doLogin()
    {
        $request = Request::instance();
        $email = $request->param('email');
        $password = $request->param('password');
        $remember = $request->param('remember');
        if(isset($remember)){
            Cookie::set('email',$email,7200);
            Cookie::set('password',$password,7200);
        }

        $user = $this->user->queryForObject(array(['email','=',$email]),'id,password,user_name,email,profile_image');
        $data = [
            'msg'=>'登陆成功!',
            'status'=>1
        ];
        if(empty($user)){
            $data['msg'] = '用户名不存在！';
            $data['status'] = 2;
        }else{
            if($user['password'] !== md5($password)){
                $data['msg'] = '密码错误！';
                $data['status'] = 2;
            }else{
                unset($user['password']);
                Session::set('user',$user);
            }
        }
       // return json($data);
        return redirect('/');
    }

    public function logout(){
        Session::clear();
        return redirect('/');
    }

    public function register(){
        return view('register');
    }

}
