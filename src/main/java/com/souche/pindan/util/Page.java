package com.souche.pindan.util;

/**
 * Created by liuqizhe on 15/10/22.
 */
public class Page {
    private Integer page = 1 ;
    private Integer pageSize = 2 ;
    private Integer totalPage = 1 ;

    public Integer getStart() {
        return (page-1)*pageSize ;
    }

    public Integer getEnd() {
        return page*pageSize + 1 ;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    @Override
    public String toString() {
        return "Page{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                '}';
    }
}
