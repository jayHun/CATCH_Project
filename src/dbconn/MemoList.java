package dbconn;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;

public class MemoList {
	private ArrayList<Integer> mnumList = new ArrayList<Integer>();
	private ArrayList<String> contentList = new ArrayList<String>();
	private ArrayList<String> titleList = new ArrayList<String>();
	private ArrayList<String> senderList = new ArrayList<String>();
	
	private boolean lastPage = false;
	
	public MemoList(){}
	public void setMnum(int index, Integer memo_nu){
		this.mnumList.add(index, memo_nu);
	}
	public void setContent(int index, String content){
		this.contentList.add(index, content);
	}
	public void setTitle(int index, String title){
		this.titleList.add(index, title);
	}
	public void setSender(int index, String sender){
		this.senderList.add(index, sender);
	}
	public void setLastPage(boolean lastPage){
		this.lastPage = lastPage;
	}
	public Integer[] getMnum(){
		return mnumList.toArray(new Integer[mnumList.size()]);
	}
	public String[] getContent(){
		return contentList.toArray(new String[contentList.size()]);
	}
	public String[] getTitle(){
		return titleList.toArray(new String[titleList.size()]);
	}
	public String[] getSender(){
		return senderList.toArray(new String[senderList.size()]);
	}
	public boolean isLastPage(){
		return lastPage;
	}
	public int getListSize(){
		return mnumList.size();
	}
}
