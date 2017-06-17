<?php
namespace app\index\model;

class Comment extends BaseModel
{

    protected $table = 'comment';

    //查询评论
    public function searchByArticleId($articleId){
        $sql = 'SELECT id,html_content,user_name,email,create_at,site,user_id FROM xx_comment WHERE status =1 AND article_id=:id ';
        return $this->query($sql,array('id'=>$articleId));
    }


}
