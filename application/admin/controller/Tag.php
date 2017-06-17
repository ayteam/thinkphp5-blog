<?php
namespace app\admin\controller;

use think\Request;
use think\Session;

class Tag extends Base
{

    protected $tagModel;

    public function __construct(\app\admin\model\Tag $tag)
    {
        $this->tagModel = $tag;
    }

    /**
     * @return \think\response\View
     */
    public function index()
    {
        $tags = $this->tagModel->queryForList();
        return view('index',['tags'=>$tags]);
    }

    public function doAdd(){
        $request = Request::instance();
        $data['tag_name'] = $request->param('tag_name');
        $row = $this->tagModel->addObject($data);
        if($row > 0){
            cache('success',$data['tag_name'].' 创建成功！',3);
            return $this->redirect('/admin/tag/index');
        }

        cache('error',$request->param('title').'稍后再试！',3);
        return $this->redirect('/admin/tag/index');
    }

    /**
     * 删除标签
     * @return void
     */
    public function del(){
        $request = Request::instance();
        $id = $request->param('id');
        $row = $this->tagModel->del(array(['id','=',$id]));
        if($row > 0){
            return json(['status'=>1]);
        }
        return json(['status'=>2]);

    }



}
