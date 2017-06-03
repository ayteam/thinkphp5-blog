<?php
namespace app\admin\controller;

use think\Request;

class Category extends Base
{

    protected $categoryModel;

    public function __construct(\app\index\model\Category $category)
    {
        parent::__construct();
        $this->categoryModel = $category;

    }

    public function index()
    {
        $categorys = $this->categoryModel->queryForList();
        return view('index',['categorys'=>$categorys]);
    }
}
