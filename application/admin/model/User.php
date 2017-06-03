<?php
namespace app\admin\model;

use think\Db;

class User extends BaseModel
{

    protected $table = 'user';

    /**
     * @return \think\Paginator
     */
    public function search(){
        $list = Db::table('xx_user')
            ->order('create_at desc')->paginate(15);
        return $list;
    }

}
