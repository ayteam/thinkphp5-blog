<?php
namespace app\index\controller;

use app\index\model\Category;
use think\Controller;
use app\index\model\Article;


class Base extends Controller
{

    protected $beforeActionList = [
        'assignUser',
        'assignHotArticle',
        'assignCategory' ,
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

}
