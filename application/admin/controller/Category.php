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

    /**
     * 添加页面
     * @return \think\response\View
     */
    public function add(){
        return view('add');
    }


    /**
     * 添加
     * @return \think\response\View
     */
    public function doAdd(){
        $request = Request::instance();
        $data['category_name'] = $request->param('category_name');
        $row = $this->categoryModel->addObject($data);
        if($row > 0){
            cache('success',$data['category_name'].' 创建成功！',3);
            return $this->redirect('/admin/category/index');
        }
        if($row > 0){
            cache('error','小主，出错啦！',3);
            return $this->redirect('/admin/category/index');
        }
    }

    /**
     * 编辑页面
     * @return \think\response\View
     */
    public function edit(){
        $request = Request::instance();
        $id = $request->param('id');
        $category = $this->categoryModel->queryForObject(array(['id','=',$id]));
        return view('edit',['category'=>$category]);
    }

    /**
     * 编辑
     * @return \think\response\View
     */
    public function doEdit(){
        $request = Request::instance();
        $data['category_name'] = $request->param('category_name');
        $id = $request->param('id');
        $row = $this->categoryModel->updateObject(array(['id','=',$id]),$data);
        if($row > 0){
            cache('success',$data['category_name'].' 修改成功！',3);
            return $this->redirect('/admin/category/index');
        }
        if($row > 0){
            cache('error','小主，出错啦！',3);
            return $this->redirect('/admin/category/index');
        }
    }

    /**
     * 删除标签
     * @return void
     */
    public function del(){
        $request = Request::instance();
        $id = $request->param('id');
        $row = $this->categoryModel->del(array(['id','=',$id]));
        if($row > 0){
            return json(['status'=>1]);
        }
        return json(['status'=>2]);

    }

}
