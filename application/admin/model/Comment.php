<?php
namespace app\admin\model;

use think\Db;

class Comment extends BaseModel
{

    protected $table = 'comment';

    /**
     * @return \think\Paginator
     */
    public function search(){
        $list = Db::table('xx_comment')->alias('c')->join('xx_article a','a.id = c.article_id')
            ->order('c.create_at desc')->field('c.id,c.content,c.create_at,c.user_name,c.email,c.html_content,c.status,c.article_id,a.title')->paginate(10);
        return $list;
    }

}
