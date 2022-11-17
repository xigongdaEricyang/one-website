import React, { useState, useEffect } from 'react';
import { Col, DatePicker, Form, Input, message, Modal, Radio, Row, Select } from 'antd';
import dayjs from 'dayjs';
import moment from 'moment';
import { useForm } from 'antd/lib/form/Form';

import ModalWrapper from '@/components/ModalWrapper';
import MarkdownEditor from '../MarkdownEditor';
import { asyncAutoPublishBlog, asyncCreateBlog, asyncEditBlog, asyncFetchBlogById, asyncFetchBlogBySlug, asyncFetchBlogCategorys, asyncFetchBlogTags } from '@/request';
import { isEn } from '@/utils';
import styles from './index.module.less';

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

  const [curPublishStatus, setCurPublishStatus] = useState(false);

  const [notifyEmails, setNotifyEmails] = useState([]);

  // timing task info
  const [timedInfo, setTimedInfo] = useState<any>({});

  const [tags, setTags] = useState<any>([]);

  const [loading, setLoading] = useState(false);

  useEffect(() => {
    asyncFetchBlogCategorys().then((res: any) => {
      setCategorys(res.list)
    });
    asyncFetchBlogTags().then((res: any) => {
      const tags = res.list;
      setTags(tags)
      asyncFetchBlogById(data.id).then((curData: any) => {
        // setBlogData(curData)
        form.setFieldsValue({
          ...curData,
          publishTime: curData.publishTime ? moment(curData.publishTime) : undefined,
          tags: (curData.tags || []),
          publish: curData?.publish
        });
        setCurPublishStatus(curData?.publish)
      });
    });
    if (type === 'add') {
      return;
    }
  }, [])

  useEffect(() => {
    if (curPublishStatus) {
      setTimedInfo({});
    }
  }, [curPublishStatus])

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
          const t = tags.find(t => parseInt(t.id) === parseInt(tag));
          if (t) {
            t.id = parseInt(t.id);
            return t;
          };
          return { name: tag }
        }),
        id: data ? parseInt(data.id) : undefined,
      });
      asyncAfterBlogBuild(type, values);
      onOk?.(res);
      setLoading(false);
      setCurVisible(false);
    })
  };

  const asyncAfterBlogBuild = async (type: string, values: any) => {
    if (values.publish) return;
    let blog_id;
    if (type === 'add') {
      const data = await asyncFetchBlogBySlug(values.slug);
      blog_id = data.id;
    } else if (type === 'edit') {
      blog_id = data.id;
    }
    const { year, month, day, hour, minute, second } = timedInfo;
    if (year && month && day && hour && minute && second) {
      const res = await asyncAutoPublishBlog({
        cron: `${second} ${minute} ${hour} ${day} ${month} ? ${year}`,
        handler: 'com.vesoft.onewebsite.handler.BlogJobHandler',
        handlerParam: JSON.stringify({ id: blog_id, isEn }),
        name: `文章《${values.title}》定时发布`,
        notifyEmails: notifyEmails.length ? notifyEmails.join(',') : undefined,
        status: true,
      })
      if (res.message === 'SUCCESS') {
        message.success('定时任务创建成功');
      }
    }
  }


  const [form] = useForm();

  const handlePublishChange = (e: any) => {
    setCurPublishStatus(e.target.value);
  }

  const handleDatePickerChange = (date: any) => {
    const formatDate = dayjs(date).format('YYYY-M-D H:m:s');
    const [d, time] = formatDate.split(' ');
    const [year, month, day] = d.split('-');
    const [hour, minute, second] = time.split(':');
    setTimedInfo({
      ...timedInfo,
      year,
      month,
      day,
      hour,
      minute,
      second,
    })
  }

  const disabledDate = current => {
    return current && current < moment(new Date()).subtract(1, 'day');
  };

  const range = (start: number, end: number) => {
    const result: any = [];
    for (let i = start; i < end; i++) {
      result.push(i);
    }
    return result;
  };

  const disabledDateTime = () => ({
    disabledHours: () => range(0, 24).splice(0, moment().hour()),
    disabledMinutes: () => range(0, 24).splice(0, moment().minute()),
  });

  const handleMailsChange = (e) => {
    setNotifyEmails(e);
  }

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
              <Radio.Group onChange={handlePublishChange}>
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
          <Col span={8}>
            <Form.Item labelCol={{ span: 5 }} wrapperCol={{ span: 18 }} label="标签" name="tags">
              <Select mode="multiple">
                {
                  tags?.map((tag: any) => (
                    <Select.Option key={tag.name} value={parseInt(tag.id)}>{tag.name}</Select.Option>
                  ))
                }
              </Select>
            </Form.Item>
          </Col>
          <Col span={9}>
            <Form.Item
              label="发布时间"
              labelCol={{ span: 5 }}
              wrapperCol={{ span: 20 }} name="publishTime">
              <DatePicker
                showTime
                format="YYYY-MM-DD HH:mm:ss"
                disabledDate={disabledDate}
                disabledTime={disabledDateTime}
              />
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
        {
          curPublishStatus === false && (
            <Row>
              <Col span={10}>
                <Form.Item
                  label="定时发布"
                  labelCol={{ span: 0 }}
                  wrapperCol={{ span: 16 }}
                >
                  <DatePicker
                    showTime
                    onChange={handleDatePickerChange}
                    format="YYYY-MM-DD HH:mm:ss"
                    disabledDate={disabledDate}
                    disabledTime={disabledDateTime}
                  />
                </Form.Item>
              </Col>
              <Col span={10}>
                <Form.Item
                  label="失败通知邮箱"
                  labelCol={{ span: 0 }}
                  wrapperCol={{ span: 16 }}
                >
                  <Select
                    mode="tags"
                    onChange={handleMailsChange}
                    tokenSeparators={[',']}
                  />
                </Form.Item>
              </Col>
            </Row>
          )
        }
      </Form>
    </Modal>
  );
};

export default ModalWrapper<IProps>(BlogModal);
