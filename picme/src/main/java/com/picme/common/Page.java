package com.picme.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

public class Page<T> implements Serializable
{

    public static <T> Page<T> create()
    {
        return new Page<T>();
    }

    public Page()
    {
        pageNo = 1;
        pageSize = 10;
        orderBy = null;
        order = null;
        autoCount = true;
        result = new ArrayList<T>();
        totalCount = -1L;
        first = -1;
        last = -1;
    }

    public Page(int pageSize)
    {
        pageNo = 1;
        this.pageSize = 10;
        orderBy = null;
        order = null;
        autoCount = true;
        result = new ArrayList<T>();
        totalCount = -1L;
        first = -1;
        last = -1;
        this.pageSize = pageSize;
    }

    public Page(int pageNo, int pageSize)
    {
        this.pageNo = 1;
        this.pageSize = 10;
        orderBy = null;
        order = null;
        autoCount = true;
        result = new ArrayList<T>();
        totalCount = -1L;
        first = -1;
        last = -1;
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public int getPageNo()
    {
        if(pageNo < 1)
            pageNo = 1;
        return pageNo;
    }

    public void setPageNo(int pageNo)
    {
        this.pageNo = pageNo;
        if(pageNo < 1)
            this.pageNo = 1;
    }

    public void setPageNo(String pageNoStr)
    {
        int pageNo = Integer.valueOf(pageNoStr).intValue();
        setPageNo(pageNo);
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        if(pageSize <= 0)
            this.pageSize = 10;
        else
            this.pageSize = pageSize;
    }

    public int getSize()
    {
        return getResult().size();
    }

    public Page<T> pageSize(int thePageSize)
    {
        setPageSize(thePageSize);
        return this;
    }

    public int getFirst()
    {
        if(first > 0)
            return first;
        else
            return (pageNo - 1) * pageSize;
    }

    public void setFirst(int first)
    {
        this.first = first;
    }

    public int getLast()
    {
        return getFirst() + result.size();
    }

    public void setLast(int last)
    {
        this.last = last;
    }

    public String getOrderBy()
    {
        return orderBy;
    }

    public void setOrderBy(String orderBy)
    {
        this.orderBy = orderBy;
    }

    public Page<T> orderBy(String theOrderBy)
    {
        setOrderBy(theOrderBy);
        return this;
    }

    public String getOrder()
    {
        return order;
    }


    public boolean isAutoCount()
    {
        return autoCount;
    }

    public void setAutoCount(boolean autoCount)
    {
        this.autoCount = autoCount;
    }

    public Page<T> autoCount(boolean theAutoCount)
    {
        setAutoCount(theAutoCount);
        return this;
    }

    public List<T> getResult()
    {
        return result;
    }

    public void setResult(List<T> result)
    {
        this.result = result;
    }

    public long getTotalCount()
    {
        if(totalCount < 0L)
            return 0L;
        else
            return totalCount;
    }

    public void setTotalCount(long totalCount)
    {
        this.totalCount = totalCount;
    }

    public void setNoLimited()
    {
        setAutoCount(false);
        setFirst(-1);
        setPageSize(-1);
    }

    public void setLimited(int start, int count)
    {
        setAutoCount(false);
        setFirst(start);
        setPageSize(count);
    }

    public void setLimited(int count)
    {
        setLimited(1, count);
    }

    public int getTotalPages()
    {
        if(totalCount < 0L)
            return 0;
        int count = (int)(totalCount / (long)pageSize);
        if(totalCount % (long)pageSize > 0L)
            count++;
        return count;
    }

    public boolean isHasNext()
    {
        return pageNo + 1 <= getTotalPages();
    }

    public int getNextPage()
    {
        if(isHasNext())
            return pageNo + 1;
        else
            return pageNo;
    }

    public boolean isHasPre()
    {
        return pageNo - 1 >= 1;
    }

    public int getPrePage()
    {
        if(isHasPre())
            return pageNo - 1;
        else
            return pageNo;
    }

    public int getStartPage()
    {
        int start = 1;
        if(getPageNo() > 5)
            start = getPageNo() - 5;
        int end = getEndPage();
        if(end == 0)
            return 0;
        int differ = (end - start) + 1;
        if(differ < 10)
            start -= 10 - differ;
        if(start < 1)
            start = 1;
        return start;
    }

    public int getEndPage()
    {
        int end = getPageNo() + 5;
        int totalPage = getTotalPages();
        if(end >= totalPage)
            end = totalPage;
        else
        if(end < 10)
            end = 10;
        if(end > totalPage)
            end = totalPage;
        return end;
    }

    public int getStartPage2()
    {
        int start = 1;
        if(getPageNo() > 10)
            start = getPageNo() - 10;
        return start;
    }

    public int getEndPage2()
    {
        int end = getPageNo() + 9;
        if(getTotalPages() < end)
            end = getTotalPages();
        if(end < 1)
            end = 1;
        return end;
    }

   public RowBounds getRowBounds()
    {
        return new RowBounds(getFirst(), getPageSize());
    }

    private static final long serialVersionUID = 5041683742265451593L;
    public static final String ASC = ":asc";
    public static final String DESC = ":desc";
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int PAGE_SEP_COUNT = 5;
    public static final int PAGE_SHOW_COUNT = 10;
    protected int pageNo;
    protected int pageSize;
    protected String orderBy;
    protected String order;
    protected boolean autoCount;
    protected List<T> result;
    protected long totalCount;
    protected int first;
    protected int last;
    
    protected Object object;

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}
    
}

