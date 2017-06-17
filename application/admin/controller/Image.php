<?php
namespace app\admin\controller;

use Blog\Oss;
use OSS\OssClient;
use think\Config;
use think\Request;
use think\Session;

class Image extends Base
{

    protected $imageModel;

    public function __construct(\app\admin\model\Image $image)
    {
        $this->imageModel = $image;
    }

    /**
     * @return \think\response\View
     */
    public function index()
    {

        $images = $this->imageModel->queryForList();
        $count = $this->imageModel->queryForCount();
//        $this->assign('ossUrl',Config::get('oss_url'));
//        $this->assign('images',$images);
//        $this->assign('image_count',$count);
        return view('index',['images'=>$images,'image_count'=>$count,'ossUrl'=>Config::get('oss_url')]);
    }

    /**
     * 删除标签
     * @return void
     */
    public function del(){
        $request = Request::instance();
        $id = $request->param('id');
        $image = $this->imageModel->queryForObject(array(['id','=',$id]));
        // 删除阿里云上的图片
        $result = Oss::deleteObject(substr($image['image_url'],1));
        $row = $this->imageModel->del(array(['id','=',$id]));
        if($row > 0){
            return json(['status'=>1]);
        }
        return json(['status'=>2]);

    }

    public function upload(){
        $request = Request::instance();
        $file = $request->file('image_name');

        if($file->check(['size'=>4200000,'ext'=>'jpg,png,gif'])){
            $info = $file->getInfo();
            $temp = explode(".", $info["name"]);
            $extension = end($temp);
            $fileName = uniqid().'.'.$extension;
            $path ='demo/';
            $result = Oss::uploadFile($path.$fileName,$info['tmp_name']);
            $data['image_name'] = $info["name"];
            $data['image_url'] = strchr($result,'/demo');
            $data['size'] = $file->getSize();
            $row = $this->imageModel->addObject($data);
            if($row > 0){
                cache('success',$info["name"].' 上传成功！',3);
                return $this->redirect('/admin/image/index');
            }
            cache('error','稍后再试！',3);
            return $this->redirect('/admin/image/index');
        }


    }



}
