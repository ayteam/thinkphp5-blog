<?php
namespace app\index\controller;

use app\index\model\Article;
use app\index\model\Comment;
use app\index\model\Tag;
use think\Request;

class Index extends Base
{

    protected $acticleModel;
    protected $tagModel;
    protected $commentModel;

    public function __construct(Article $article,Tag $tag,Comment $comment)
    {
        parent::__construct();
        $this->acticleModel = $article;
        $this->tagModel = $tag;
        $this->commentModel = $comment;
    }




    public function index()
    {
      //  return $this->fetch(ROOT_PATH."/runtime/index.htm");
       // dump(config('three'));die;
        //$where =array(['id','=',4]);
        //$articles = $this->acticleModel->searchPage();
        $articles = $this->acticleModel->search();
        $page = $articles->render();
        $articles = $articles->toArray();
        foreach ($articles['data'] as $key=>$article){
            $articles['data'][$key]['tags'] =  $this->tagModel->queryForList(array(['id','in',explode(',',$article['tag_id'])]),'id,tag_name');
            $articles['data'][$key]['comment_count'] = $this->commentModel->queryForCount(array(['article_id','=',$article['id']]));
        }
        if(!ini_get('output_buffering')){
            ob_start();
        }
        $content =  view('index',['articles'=>$articles,'count'=>count($articles),'page'=>$page])->getContent();



//获取缓冲区中的页面，并清除缓冲区
      //  $content = ob_get_clean();
//将页面保存成为静态文件
        file_put_contents(ROOT_PATH."/runtime/index.htm",$content);
      //  dump($content);die;
        return view('index',['articles'=>$articles,'count'=>count($articles),'page'=>$page]);
    }

    // 查询
    public function search(){
        $request = Request::instance();
        $keyword = $request->param('keyword');
        $articles = $this->acticleModel->searchByKeyword($keyword);
        $page = $articles->render();
        $articles = $articles->toArray();
        foreach ($articles['data'] as $key=>$article){
            $articles['data'][$key]['tags'] =  $this->tagModel->queryForList(array(['id','in',explode(',',$article['tag_id'])]),'id,tag_name');
            $articles['data'][$key]['comment_count'] = $this->commentModel->queryForCount(array(['article_id','=',$article['id']]));
        }
        return view('index',['articles'=>$articles,'count'=>count($articles),'page'=>$page]);
    }
}
