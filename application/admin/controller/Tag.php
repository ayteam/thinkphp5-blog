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



}
