<?php
namespace app\index\controller;

use app\index\model\Comment;
use app\index\model\Tag;
use think\Request;

class Category extends Base
{

    protected $categoryModel;
    protected $tagModel;
    protected $commentModel;

    public function __construct(\app\index\model\Category $category,Tag $tag,Comment $comment)
    {
        parent::__construct();
        $this->categoryModel = $category;
        $this->tagModel = $tag;
        $this->commentModel = $comment;
    }

    public function index(Request $request)
    {
        $categortId = $request->param('id');
        $category = $this->categoryModel->queryForObject(array(['id','=',$categortId]));
        $articles = $this->categoryModel->search($categortId);
        $page = $articles->render();
        $articles = $articles->toArray();
        foreach ($articles['data'] as $key=>$article){
            $articles['data'][$key]['tags'] =  $this->tagModel->queryForList(array(['id','in',explode(',',$article['tag_id'])]),'id,tag_name');
            $articles['data'][$key]['comment_count'] = $this->commentModel->queryForCount(array(['article_id','=',$article['id']]));
        }
        return view('index',['articles'=>$articles,'count'=>count($articles),'page'=>$page,'category'=>$category]);
    }
}
