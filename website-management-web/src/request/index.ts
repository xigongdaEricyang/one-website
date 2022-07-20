import axios from 'axios';

export const DEFAULT_PAGE_SIZE = 10;

export const asyncCreateBlog = async (data) => {
  const res = await axios.post(
    `/erupt-api/data/modify/Blog`,
    {
      ...data,
    },
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: 'Blog'
      },
    });

  return res;
}

export const asyncEditBlog = async (data) => {
  const res = await axios.put(
    `/erupt-api/data/modify/Blog`,
    {
      ...data,
    },
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: 'Blog'
      },
    });

  return res;
}

export const asyncFetchBlogs = async (pageIndex: number) => {
  const res = await axios.post(
    `/erupt-api/data/table/Blog`,
    {
      pageIndex,
      pageSize: DEFAULT_PAGE_SIZE,
      sort: ''
    },
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: 'Blog'
      },
    });
  if (res.status === 200) {
    return res.data;
  }
  return {
    list: [],
    total: 0
  };
}

export const asyncDeleteBlogById = async (id: number) => {
  const res = await axios.delete(
    `/erupt-api/data/modify/Blog/${id}`,
    {
      headers: {
        token: (parent as any).getAppToken().token,
        erupt: 'Blog'
      },
    });

  return res;
}