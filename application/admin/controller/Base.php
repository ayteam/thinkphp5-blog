<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;

class Base extends Controller
{

    protected $beforeActionList = [
        'auth',
    ];

    protected function auth(){
        //验证用户是否登陆
        $adminUser = Session::get('AdminUser');
        if(empty($adminUser)){

        }
    }

}
