<?php
namespace app\index\model;

use think\Db;

class Article extends BaseModel
{

    protected $table = 'article';



    /**
     * 分页查询
     * @param int $page
     * @return mixed
     */
    public function searchPage($curPage=1)
    {
        $sql = 'SELECT a.id,a.title,a.description,a.view_count,a.create_date,a.tag_id,c.category_name FROM xx_article a INNER JOIN xx_category c ON c.id = a.category_id 
                WHERE 1=1';
        $sql .= ' ORDER BY a.create_date DESC';
        return $this->queryForPage($sql,$curPage);
    }

    /**
     * @return \think\Paginator
     */
    public function search(){
        $list = Db::table('xx_article')->alias('a')->join('xx_category c','a.category_id = c.id')
            ->order('create_date desc')->field('a.id,a.title,a.description,a.view_count,a.create_date,a.tag_id,c.category_name')->paginate(6);
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

}
