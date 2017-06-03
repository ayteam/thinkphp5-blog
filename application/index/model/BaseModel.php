<?php
namespace app\index\model;

use think\Model;
use think\Db;

class BaseModel extends Model
{
    protected $table = '';

    /**
     * 分页查询
     * @param String $sql 查询sql语句
     * @return list
     */
    public function queryForPage($sql,$curPage,$pageSize=7){
        $curPage = (isset($curPage) && $curPage > 0) ? $curPage : 1;//默认当前页 是第一页
        //查询集合
        $limitSql = $sql." limit ".($curPage-1)*$pageSize.','.$pageSize;
        $list = Db::query($limitSql);//查询分页
        $data['data'] = empty($list) ? [] : $list;
        //查询条数
        $count = Db::query("SELECT COUNT(a.id) AS count FROM (".$sql.") a");
        $nums = $count[0]['count'];
        $data['recordsTotal'] = intval($nums);
        $data['recordsFiltered'] = intval($nums);
        return $data;
    }

    /**
     * 纯sql查询
     * @return mixed
     */
    public function queryForSql($sql){
        return Db::query($sql);
    }

    /**
     * 纯sql 更新和写入
     * @param $sql
     * @return int
     */
    public function executeForSql($sql){
        return Db::execute($sql);
    }

    /**
     * 更新条件查询
     * @param String $column 查询字段
     * @param array $where 查询条件
     * @return \Think\mixed
     */
    public function queryForList($where=array(),$column=''){
        return self::querys($this->table,$where,$column)->select();
    }

    /**
     * 更新条件查询
     * @param String $column 查询字段
     * @param array $where 查询条件
     * @return \Think\mixed
     */
    public function queryForObject($where=array(),$column=''){
        return self::querys($this->table,$where,$column)->find();
    }

    public function queryForCount($where=array()){
        return self::querys($this->table,$where)->count();
    }

    /**添加一条数据
     * $data = ['foo' => 'bar', 'bar' => 'foo'];
     * @return int
     */
    public function addObject($data=array()){
        return Db::name($this->table)->insert($data);
    }

    /**
     * 添加多条数据
     * $data = [['foo' => 'bar', 'bar' => 'foo'],['foo' => 'bar2', 'bar' => 'foo2']];
     * @return int
     */
    public function addAll($data=array()){
        return Db::name($this->table)->insertAll($data);
    }

    /**
     * 新增一条数据并返回主键值
     * @return int
     */
    public function addObjectGetId($data=array()){
        return Db::name($this->table)->insertGetId($data);
    }

    /**
     * 返回影响数据的条数，没修改任何数据返回 0
     * $data = ['name' => 'thinkphp','id'=>1];
     * @return int
     */
    public function updateObject($where=array(),$data=array()){
        return self::querys($this->table,$where,null)->update($data);
    }

    /**
     * 返回影响数据的条数，没有删除返回 0
     * @return int
     */
    public function del($where=array()){
        return self::querys($this->table,$where,null)->delete();
    }

    /**
     * 调用存储过程
     */
    public function procedure($params){
        return Db::query("call sp_query($params)");
    }

    /**
     * 获取开始事务
     */
    public function startTrans(){
        Db::startTrans();;
    }

    /**
     * 提交事务
     */
    public function commit(){
        Db::commit();
    }

    /**
     * 回滚事务
     */
    public function rollback(){
        Db::rollback();
    }

    /**
     * @param String $table 查询的表名
     * @param array $where 查询条件  如：$where = array(['id','>=',1],['name','=','测试'],['id','in',[1,5,80,50]]);
     * @param array $column 查询字段  如：$column = 'id,name';
     */
    static function querys($table,$where=array(),$column = ''){
        $query = Db::name($table);

        if(!empty($where)){
            $num = count($where);
            for($i = 0; $i < $num; $i++){
                $query ->where($where[$i][0],$where[$i][1],$where[$i][2]);
            }
        }
        if(!empty($column)){
            $query->field($column);
        }
        return $query;
    }

}
