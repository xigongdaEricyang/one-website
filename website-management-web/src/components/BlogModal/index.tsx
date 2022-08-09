import React, { useState, useEffect } from 'react';
import { Col, Form, Input, message, Modal, Radio, Row, Select } from 'antd';

import ModalWrapper from '@/components/ModalWrapper';
import styles from './index.module.less';
import { useForm } from 'antd/lib/form/Form';
import MarkdownEditor from '../MarkdownEditor';
import { asyncCreateBlog, asyncEditBlog, asyncFetchBlogById, asyncFetchBlogCategorys, asyncFetchBlogTags } from '@/request';

interface IProps {
  visible?: boolean;
  type: 'add' | 'edit';
  data?: any;
  onOk?: any;
  onCancel?: any;
  hide?: () => void;
}

const TITLE = {
  add: '新增博客',
  edit: '编辑博客',
}

const curInitialValue = {
  publish: false
};

const BlogModal: React.FC<IProps> = (props: IProps) => {
  const { onOk, onCancel, hide, visible, data, type } = props;

  const [curVisible, setCurVisible] = useState(visible);

  const [categorys, setCategorys] = useState([]);

  // const [ blogData, setBlogData ] = useState(data);

  const [tags, setTags] = useState<any>([]);

  const [loading, setLoading] = useState(false);

  useEffect(() => {
    asyncFetchBlogCategorys().then((res: any) => {
      setCategorys(res.list)
    });
    asyncFetchBlogTags().then((res: any) => {
      setTags(res.list)
    });
    if (type === 'add') {
      return;
    }
    asyncFetchBlogById(data.id).then((curData: any) => {
      // setBlogData(curData)
      form.setFieldsValue({
        ...curData,
        tags: (curData.tags || []).map((item: any) => item.name),
        publish: curData?.publish === '发布' ? true : false
      });
    });
  }, [])

  useEffect(() => {
    if (!curVisible) {
      hide && hide();
    }
  }, [curVisible]);

  const handleCancelClick = () => {
    onCancel?.();
    setCurVisible(false);
  };
  const handleOkClick = () => {
    form.validateFields().then(async (values) => {
      setLoading(true);
      const blog_category = categorys.find((item: any) => item.name === values.blog_category_name);
      const fn = type === 'add' ? asyncCreateBlog : asyncEditBlog;
      const { data: res } = await fn({
        ...values,
        blog_category,
        tags: (values.tags || []).map(tag => {
          const t = tags.find(t => t.name === tag);
          if (t) {
            t.id = parseInt(t.id);
            return t;
          };
          return { name: tag }
        }),
        id: data ? parseInt(data.id) : undefined,
      });
      onOk?.(res);
      setLoading(false);
      setCurVisible(false);
    })
  };


  const [form] = useForm();

  return (
    <Modal
      title={TITLE[type]}
      className={styles.blogModal}
      visible={curVisible}
      width={1000}
      onOk={handleOkClick}
      okButtonProps={{
        loading
      }}
      maskClosable={false}
      onCancel={handleCancelClick}
      okText="确认"
      cancelText="取消"
    >
      <Form
        labelCol={{ span: 5 }}
        labelAlign="right"
        wrapperCol={{ span: 19 }}
        form={form}
        initialValues={curInitialValue}
      >
        <Row>
          <Col span={12}>
            <Form.Item label="封面地址" name="pic"
              required
              rules={[
                {
                  required: true,
                  message: '封面地址必填',
                },
              ]}
            >
              <Input placeholder='输入封面图片url地址' />
            </Form.Item>
          </Col>
          <Col span={12}>
            <Form.Item label="标题" name="title"
              required
              rules={[
                {
                  required: true,
                  message: '文章标题必填',
                },
              ]}
            >
              <Input placeholder='输入博客文章标题' />
            </Form.Item>
          </Col>
        </Row>
        <Row>
          <Col span={7}>
            <Form.Item label="作者" name="author"
              required
              rules={[
                {
                  required: true,
                  message: '作者必填',
                },
              ]}
            >
              <Input placeholder='输入博客作者' />
            </Form.Item>
          </Col>
          <Col span={10}>
            <Form.Item label="描述" name="description"
              required
              rules={[
                {
                  required: true,
                  message: '描述必填',
                },
              ]}
            >
              <Input.TextArea placeholder='描述' />
            </Form.Item>
          </Col>
          <Col span={7}>
            <Form.Item label="发布状态" name="publish" labelCol={{
              span: 8
            }}
              required
              rules={[
                {
                  required: true,
                  message: '封面地址必填',
                },
              ]}
            >
              <Radio.Group>
                <Radio value={true}>发布</Radio>
                <Radio value={false}>草稿</Radio>
              </Radio.Group>
            </Form.Item>
          </Col>
        </Row>
        <Row>
          <Col span={24} >
            <Form.Item labelAlign='left' label="slug(唯一标识，用于SEO)" name="slug"
              required
              rules={[
                {
                  required: true,
                  message: 'slug必填',
                },
              ]}>
              <Input />
            </Form.Item>
          </Col>
        </Row>
        <Row>
          <Col span={7}>
            <Form.Item label="分类" name="blog_category_name"
              required
              rules={[
                {
                  required: true,
                  message: '分类必填',
                },
              ]}>
              <Select>
                {
                  categorys?.map((cat: any) => (
                    <Select.Option key={cat.name}>{cat.name}</Select.Option>
                  ))
                }
              </Select>
            </Form.Item>
          </Col>
          <Col span={10}>
            <Form.Item label="标签" name="tags">
              <Select mode="tags">
                {
                  tags?.map((tag: any) => (
                    <Select.Option key={tag.name}>{tag.name}</Select.Option>
                  ))
                }
              </Select>
            </Form.Item>
          </Col>
        </Row>
        <Row>
          <Col span={24}>
            <Form.Item name="content"
              labelCol={{ span: 0 }}
              wrapperCol={{ span: 24 }}
            >
              <MarkdownEditor />
            </Form.Item>
          </Col>
        </Row>

      </Form>
    </Modal>
  );
};

export default ModalWrapper<IProps>(BlogModal);
