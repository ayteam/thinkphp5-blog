<?php
namespace app\index\model;

use think\Db;

class Article extends BaseModel
{

    protected $table = 'article';



    /**
     *  文章详情
     */
    public function searchInfo($id)
    {

        $sql = 'SELECT a.id,a.title,a.description,a.view_count,a.create_at,a.tag_id,a.category_id,a.comment_count,a.user_id,a.html_content,c.category_name FROM xx_article a 
                INNER JOIN xx_category c ON c.id = a.category_id 
                WHERE  a.id=:id';

        $articles = $this->queryForSql($sql,array('id'=>$id));
        return $articles[0];
    }

    /**
     * @return \think\Paginator
     */
    public function search(){
        $list = Db::table('xx_article')->alias('a')->join('xx_category c','a.category_id = c.id')
            ->order('create_at desc')->field('a.id,a.title,a.description,a.view_count,a.create_at,a.tag_id,a.category_id,c.category_name')->paginate(6);
        return $list;
    }

    /**
     * @return \think\Paginator
     */
    public function searchByKeyword($keyword){
        $list = Db::table('xx_article')->alias('a')->join('xx_category c','a.category_id = c.id')
            ->order('create_at desc')->field('a.id,a.title,a.description,a.view_count,a.create_at,a.tag_id,a.category_id,c.category_name')->paginate(6);
        return $list;
    }

    /**
     * 查询最热的文章
     */
    public function searchHot()
    {
        $list = Db::name('article')
            ->order('view_count desc')->field('title,view_count')->limit(7)->select();
        return $list;
    }

    // 增加访问量
    public function updateViewCount($id){
        $sql = 'UPDATE xx_article SET view_count =view_count+1 WHERE id =:id';
        return Db::execute($sql,['id'=>$id]);
    }

}
