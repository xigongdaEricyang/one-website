import React, { useEffect, useMemo, useState } from 'react';
import { Button, message, Popconfirm, Table, Tag } from 'antd';

import BlogModal from '@/components/BlogModal';
import { asyncDeleteBlogById, asyncFetchBlogs, DEFAULT_PAGE_SIZE } from '@/request';

import styles from './index.module.less';
import { DeleteOutlined, EditOutlined, EyeOutlined } from '@ant-design/icons';
import BlogViewModal from '@/components/BlogViewModal';


const BlogManagement = () => {

  const [blogs, setBlogs] = useState([]);
  const [total, setTotal] = useState(0);
  const [curPage, setCurPage] = useState(1);

  useEffect(() => {
    fetchBlogs();
  }, [curPage]);

  const fetchBlogs = () => {
    asyncFetchBlogs(curPage).then((res: any) => {
      const { list, total } = res;
      setTotal(parseInt(total))
      setBlogs(list.map((item, i) => {
        item.key = i;
        return item;
      }));
    });
  }

  const handleDeleteBlog = async (id) => {
    const { data: res }: any = await asyncDeleteBlogById(id);
    if (res.status === "SUCCESS") {
      message.success('删除成功');
      fetchBlogs();
    }
  }

  const handleViewBlog = (item) => {
    BlogViewModal.show({
      data: item
    })
  }

  const handleEditBlog = (item) => {
    BlogModal.show({
      data: item,
      type: 'edit',
      onOk: (res) => {
        if (res.status === 'SUCCESS') {
          message.success('编辑成功');
        }
        fetchBlogs();
      }
    })
  }

  const columns = useMemo(() => (
    [
      {
        key: 'id',
        title: 'id',
        dataIndex: 'id',
        width: '40px'
      },
      {
        key: 'pic',
        title: '封面图',
        dataIndex: 'pic',
        width: 150,
        render: (pic) => (
          <img className={styles.pic} src={pic} />
        )
      },
      {
        key: 'title',
        title: '标题',
        dataIndex: 'title',
        width: 200,
      },
      {
        key: 'description',
        title: '描述',
        dataIndex: 'description',
        width: 400,
      },
      {
        key: 'author',
        title: '作者',
        dataIndex: 'author',
        width: 100
      },
      {
        key: 'publish',
        title: '发布状态',
        dataIndex: 'publish',
        width: 100,
        render: (publish) => (
          <Tag color={publish === '发布' || publish === 'publish' ? 'green' : 'red'}>{publish}</Tag>
        )
      },
      {
        key: 'category',
        title: '文章类型',
        dataIndex: 'blog_category_name',
        width: 100,
      },
      {
        key: 'content',
        title: '内容',
        dataIndex: 'content',
        width: 500,
        render: (content) => (
          <div className={styles.content}>{content}</div>
        )
      },
      {
        key: 'createTime',
        title: '创建时间',
        dataIndex: 'createTime',
        width: 150
      },
      {
        key: 'updateTime',
        title: '修改时间',
        dataIndex: 'updateTime',
        width: 150
      },
      {
        key: 'action',
        title: '操作',
        width: 150,
        render: (item) => (
          <div className={styles.action}>
            <EyeOutlined onClick={() => handleViewBlog(item)} className={styles.actionItem} />
            <EditOutlined onClick={() => handleEditBlog(item)} className={styles.actionItem} style={{ marginLeft: '24px' }} />
            <Popconfirm
              title="确认删除该博客？"
              okText="确认"
              cancelText="取消"
              placement='top'
              onConfirm={() => handleDeleteBlog(item.id)}
            >
              <DeleteOutlined className={styles.actionItem} style={{ marginLeft: '24px' }} />
            </Popconfirm>
          </div>
        )
      }
    ]
  ), [curPage]);

  const showAddBlogModal = () => {
    BlogModal.show({
      type: 'add',
      onOk: (res) => {
        if (res.status === 'SUCCESS') {
          message.success('创建成功');
        }
        fetchBlogs();
      }
    })
  }

  const handlePageChange = (page: number, _pageSize: number) => {
    setCurPage(page);
  }


  return (
    <div className={styles.blogManagement}>
      <div className={styles.actions}>
        <Button type="primary" onClick={showAddBlogModal}>新增博客</Button>
      </div>
      <div className={styles.table}>
        <Table
          columns={columns}
          dataSource={blogs}
          scroll={{ x: 1500 }}
          pagination={
            {
              pageSize: DEFAULT_PAGE_SIZE,
              total,
              onChange: handlePageChange
            }
          }
        />
      </div>
    </div>
  )
}

export default BlogManagement;