<?php
namespace app\index\controller;

use app\index\model\Category;
use think\Cache;
use think\Controller;
use app\index\model\Article;
use think\Request;


class Base extends Controller
{

    protected $beforeActionList = [
        'assignUser',
        'assignHotArticle',
        'assignCategory' ,
        'updateArticleViewCount' =>  ['except'=>'Article.info'],
    ];

    protected function assignUser(){
        $author = config('author');
        $three = config('three');
        $this->assign('author',$author);
        $this->assign('three',$three);
        $this->assign('three_count',intval(12/count($three)));
    }


    protected function assignHotArticle(){
        // 查询 热门文章
        $acticle = new Article();
        $hotArticles = $acticle->searchHot();
        $this->assign('hotArticles',$hotArticles);
    }

    protected function assignCategory(){
        $category = new Category();
        $acticle = new Article();
        $categorys = $category->queryForList(array());
        foreach ($categorys as $key=>$category){
            $categorys[$key]['article_count'] = $acticle->queryForCount(array(['category_id','=',$category['id']]));
        }
        $this->assign('categorys',$categorys);
    }

    protected function updateArticleViewCount(){
        $request = Request::instance();
        $id = $request->param('id');
        $ip = getIp();
        $ipArray = Cache::get('ipArray');
        $ipArray = empty($ipArray) ? array() :$ipArray;
        if(!in_array($ip,$ipArray)){
            $articleModel = new Article();
            $articleModel->updateViewCount($id);
            $ipArray[] = $ip;
            Cache::set('ipArray',$ipArray);
            Cache::rm('article_info');
        }

    }

}
