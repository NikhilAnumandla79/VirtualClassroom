package com.virtualclassrooms.model;

public class News {
 private String headLine;
 private String content;
 
public News() {
	
}
public News(String headLine, String content) {
	super();
	this.headLine = headLine;
	this.content = content;
}
public String getHeadLine() {
	return headLine;
}
public void setHeadLine(String headLine) {
	this.headLine = headLine;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
@Override
public String toString() {
	return "News [headLine=" + headLine + ", content=" + content + "]";
}
 
}
