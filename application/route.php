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
Route::rule('index/search','index/index/search','get');
Route::rule('login','index/Login/index','get');
Route::rule('register','index/Login/register','get');
Route::rule('user/:id','index/User/index','get');
Route::rule('article/info/:id','index/Article/info','get');
Route::rule('article/info/:id','index/Article/info','post');
Route::rule('comment/index/:id','index/Comment/index','get');


//----------------------admin---------------------------
Route::rule('admin/article/edit/:id','admin/Article/edit','get');
Route::rule('admin/article/doEdit/:id','admin/Article/doEdit','post');

Route::rule('admin/tag/del/:id','admin/Tag/del','get');

Route::rule('admin/category/del/:id','admin/category/del','get');
Route::rule('admin/category/edit/:id','admin/category/edit','get');
Route::rule('admin/image/del/:id','admin/image/del','get');