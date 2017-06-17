<?php
namespace app\index\controller;

use app\index\model\Tag;
use think\Cache;
use think\Request;
use think\Session;

class Article extends Base
{

    protected $articleModel;
    protected $tagModel;

    public function __construct(\app\index\model\Article $article,Tag $tag)
    {
        parent::__construct();
        $this->articleModel = $article;
        $this->tagModel = $tag;
    }

    /**
     * @return \think\response\View
     */
    public function info()
    {
        $request = Request::instance();
        $id = $request->param('id');
        $path = Cache::get('article_info');
      //  if(empty($path)){
            $article = $this->articleModel->searchInfo($id);
            $tags = $this->tagModel->queryForList(array(['id','in',$article['tag_id']]));
            if(!ini_get('output_buffering')){
                ob_start();
            }
            $content =  view('info',['article'=>$article,'tags'=>$tags])->getContent();;
            $path = ROOT_PATH."/public/cache/info.html";
            file_put_contents($path,$content);
            Cache::set('article_info',$path,14400);
      //  }
        // 增加访问量
      //  return $this->fetch($path);
        return view('info',['article'=>$article,'tags'=>$tags]);
    }




}
