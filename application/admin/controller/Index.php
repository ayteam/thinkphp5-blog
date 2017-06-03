<?php
namespace app\admin\controller;

use app\admin\model\Article;
use app\admin\model\Category;
use app\admin\model\Comment;
use app\admin\model\Image;
use app\admin\model\Tag;
use app\admin\model\User;

class Index extends Base
{

    protected $acticleModel;
    protected $tagModel;
    protected $commentModel;
    protected $userModel;
    protected $categoryModel;
    protected $imageModel;

    public function __construct(Article $article,Tag $tag,Comment $comment,User $user,Category $category,Image $image)
    {
        parent::__construct();
        $this->acticleModel = $article;
        $this->tagModel = $tag;
        $this->commentModel = $comment;
        $this->userModel = $user;
        $this->imageModel = $image;
        $this->categoryModel = $category;
    }




    public function index()
    {
        $info['article_count'] = $this->acticleModel->queryForCount();
        $info['user_count'] = $this->userModel->queryForCount();
        $info['category_count'] = $this->categoryModel->queryForCount();
        $info['tag_count'] = $this->tagModel->queryForCount();
        $info['comment_count'] = $this->commentModel->queryForCount();
        $info['image_count'] = $this->imageModel->queryForCount();
        return view('index',['info'=>$info]);
    }
}
