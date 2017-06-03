<?php
namespace app\admin\model;

use think\Db;

class Article extends BaseModel
{

    protected $table = 'article';

    /**
     * @return \think\Paginator
     */
    public function search(){
        $list = Db::table('xx_article')->alias('a')->join('xx_category c','a.category_id = c.id')
            ->order('create_date desc')->field('a.id,a.title,a.status,a.description,a.view_count,a.create_date,a.tag_id,c.category_name')->paginate(6);
        return $list;
    }


}
