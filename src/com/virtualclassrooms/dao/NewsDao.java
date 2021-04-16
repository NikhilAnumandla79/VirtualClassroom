package com.virtualclassrooms.dao;

import java.util.List;

import com.virtualclassrooms.model.News;

public interface NewsDao {
	List<News> fetchNews();
}
