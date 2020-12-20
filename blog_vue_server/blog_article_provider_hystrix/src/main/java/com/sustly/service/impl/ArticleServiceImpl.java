package com.sustly.service.impl;

import com.sustly.dao.ArticleDao;
import com.sustly.entry.Blog;
import com.sustly.service.ArticleService;
import com.sustly.elastic.ElasticsearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

/**
 * @author liyue
 * @date 2019/6/20 15:46
 */
@Service
@Transactional(rollbackFor = {Exception.class})
public class ArticleServiceImpl implements ArticleService {

    private final ArticleDao articleDao;
    private final ElasticsearchService elasticsearchService;

    @Autowired
    public ArticleServiceImpl(ArticleDao articleDao, ElasticsearchService esUtil) {
        this.articleDao = articleDao;
        this.elasticsearchService = esUtil;
    }

    @Override
    public void save(Blog blog) {
        if (blog.getId() == null) {
            articleDao.save(blog);
            try {
                elasticsearchService.addData(blog, blog.getId().toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            articleDao.update(blog);
            try {
                elasticsearchService.updateDataById(blog, blog.getId().toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Blog findById(Integer id) {
        return articleDao.getBlogById(id);
    }

    @Override
    public void delete(Integer id) {
        articleDao.deleteById(id);
        try {
            elasticsearchService.deleteDataById(id.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public long getAllCount() {
        return articleDao.count();
    }

    @Override
    public List<Blog> getBlogListByPage(Integer page) {
        int startRow = page * 10;
        return articleDao.findAllPageByCreateTime(startRow, 10);
    }

    @Override
    public List<Blog> getBlogListByView(Integer page) {
        int startRow = page * 10;
        return articleDao.findAllPageByViews(startRow, 10);
    }

    @Override
    public long getAllCountByCategory(String category) {
        return articleDao.countByCategory(category);
    }

    @Override
    public List<Blog> getBlogListByCategory(Integer page, String category) {
        int startRow = page * 10;
        return articleDao.findAllPageByCategoryAndCreateTime(category, startRow, 10);
    }

    @Override
    public List<Blog> search(String search, Integer page) {
        int startRow = page * 10;
        String[] field = {"title", "category", "content"};
        List<Blog> esPage = null;
        try {
            esPage = elasticsearchService.searchDataPage(startRow, 10, field, search);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (esPage == null){
            return null;
        }
        return esPage;
    }

    @Override
    public List<Blog> getBlogListByUsernameAndPage(Integer page, String username) {
        int startRow = page * 10;
        return articleDao.findAllPageByCategoryAndUsername(username, startRow, 10);
    }
}
