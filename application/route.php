<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
//return [
//    '__pattern__' => [
//        'name' => '\w+',
//    ],
//    '[hello]'     => [
//        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
//        ':name' => ['index/hello', ['method' => 'post']],
//    ],
//
//
//];
Route::rule('index/category/:id','index/Category/index','get');
Route::rule('login','index/Login/index','get');
Route::rule('user/:id','index/User/index','get');

//----------------------admin---------------------------
Route::rule('admin/article/edit/:id','admin/Article/edit','get');
Route::rule('admin/article/doEdit/:id','admin/Article/doEdit','post');