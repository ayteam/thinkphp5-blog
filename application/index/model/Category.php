<?php
namespace app\index\model;
use think\Db;
class Category extends BaseModel
{

    protected $table = 'category';

    /**
     * 查询分类下文章
     * @return \think\Paginator
     */
    public function search($categoryId){
        $list = Db::table('xx_article')->alias('a')->join('xx_category c','a.category_id = c.id')
            ->order('create_date desc')->field('a.id,a.title,a.description,a.view_count,a.create_date,a.tag_id,c.category_name')
            ->where('a.category_id','=',$categoryId)->paginate(6);
        return $list;
    }

}
