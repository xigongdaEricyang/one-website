import React, { useEffect, useMemo, useState } from 'react';
import { Button, Col, Form, Input, message, Popconfirm, Row, Select, Table, Tag } from 'antd';

import BlogModal from '@/components/BlogModal';
import { asyncDeleteBlogById, asyncFetchBlogCategorys, asyncFetchBlogs, asyncFetchBlogTags, asyncSearchBlogList, DEFAULT_PAGE_SIZE } from '@/request';

import styles from './index.module.less';
import { DeleteOutlined, EditOutlined, EyeOutlined } from '@ant-design/icons';
import BlogViewModal from '@/components/BlogViewModal';
import { useForm } from 'antd/lib/form/Form';
import { formatDay } from '@/utils';


const BlogManagement = () => {

  const [blogs, setBlogs] = useState([]);
  const [total, setTotal] = useState(0);
  const [curPage, setCurPage] = useState(1);

  const [form] = useForm();

  const [categorys, setCategorys] = useState([]);

  const [tags, setTags] = useState<any>([]);

  useEffect(() => {
    asyncFetchBlogCategorys().then((res: any) => {
      setCategorys(res.list)
    });

    asyncFetchBlogTags().then((res: any) => {
      setTags(res.list)
    });
  }, [])

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
          <Tag color={publish  ? 'green' : 'red'}>{publish ? '发布' : '草稿'}</Tag>
        )
      },
      {
        key: 'category',
        title: '文章类型',
        dataIndex: 'categoryName',
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
        title: '发布时间',
        dataIndex: 'publishTime',
        width: 150,
        render: (publishTime) => publishTime ? formatDay(publishTime) : ''
      },
      {
        key: 'createTime',
        title: '创建时间',
        dataIndex: 'createTime',
        width: 150,
        render: (createTime) => createTime ? formatDay(createTime) : ''
      },
      {
        key: 'updateTime',
        title: '修改时间',
        dataIndex: 'updateTime',
        width: 150,
        render: (updateTime) => updateTime ? formatDay(updateTime) : ''
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

  const handleSearch = () => {
    setCurPage(1);
    asyncSearchBlogList(form.getFieldsValue(), curPage).then(res => {
      const { list, total } = res.data;
      setTotal(parseInt(total))
      setBlogs(list.map((item, i) => {
        item.key = i;
        return item;
      }));
    })
  }

  const handleReset = () => {
    form.resetFields();
    fetchBlogs();
  }


  return (
    <div className={styles.blogManagement}>
      <div className={styles.actions}>
        <Button type="primary" onClick={showAddBlogModal}>新增博客</Button>
      </div>
      <div className={styles.searchContent}>
        <Form form={form}>
          <Row gutter={24}>
            <Col span={5}>
              <Form.Item label="标题" name="title">
                <Input />
              </Form.Item>
            </Col>
            <Col span={5}>
              <Form.Item label="作者" name="author">
                <Input />
              </Form.Item>
            </Col>
            <Col span={5}>
              <Form.Item label="文章类型" name="categoryId">
                <Select>
                  {
                    categorys?.map((cat: any) => (
                      <Select.Option key={cat.id}>{cat.name}</Select.Option>
                    ))
                  }
                </Select>
              </Form.Item>
            </Col>
            <Col span={5}>
              <Form.Item label="标签" name="tagId">
                <Select>
                  {
                    tags?.map((tag: any) => (
                      <Select.Option key={tag.id}>{tag.name}</Select.Option>
                    ))
                  }
                </Select>
              </Form.Item>
            </Col>
            <Col span={4}>
              <Button onClick={handleSearch} type='primary'>搜索</Button>
              <Button onClick={handleReset} style={{marginLeft: 24}}>重置</Button>
            </Col>
          </Row>
        </Form>
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