import React, { useState, useEffect } from 'react';
import { Col, Descriptions, Form, Input, message, Modal, Radio, Row, Tag } from 'antd';

import ModalWrapper from '@/components/ModalWrapper';
import styles from './index.module.less';
import { useForm } from 'antd/lib/form/Form';
import MarkdownEditor from '../MarkdownEditor';
import { asyncFetchBlogById, asyncFetchBlogTags } from '@/request';
// import { asyncCreateBlog } from '@/request';

interface IProps {
  visible?: boolean;
  data?: any;
  onOk?: any;
  onCancel?: any;
  hide?: () => void;
}
const initialValue = {
  publish: true
}

const BlogViewModal: React.FC<IProps> = (props: IProps) => {
  const { onOk, onCancel, hide, visible, data } = props;

  const [curVisible, setCurVisible] = useState(visible);

  const [loading, setLoading] = useState(false);

  const [blogData, setBlogData] = useState(data);

  const [tags, setTags] = useState<any>([]);

  useEffect(() => {
    asyncFetchBlogTags().then((res: any) => {
      const tags = res.list;
      setTags(tags)
    });
    asyncFetchBlogById(data.id).then((curData: any) => {
      // setBlogData(curData)
      setBlogData(curData)
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
    // form.validateFields().then(async (values) => {
    //   setLoading(true);
    //   const { data: res } = await asyncCreateBlog(values);
    //   if (res.status === 'SUCCESS') {
    //     message.success('创建成功');
    //   }
    //   onOk?.(res);
    //   setLoading(false);
    //   setCurVisible(false);
    // })
  };
  return (
    <Modal
      title="查看详情"
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
      <Descriptions layout="horizontal" labelStyle={{fontWeight: 'bold', marginRight: 30, marginLeft: 30}}>
        <Descriptions.Item label="封面">
          <img className={styles.cover} src={data.pic} alt="" />
        </Descriptions.Item>
        <Descriptions.Item label="标题">
          {data.title}
        </Descriptions.Item>
        <Descriptions.Item label="作者">
          {data.author}
        </Descriptions.Item>
        <Descriptions.Item label="slug">
          {data.slug}
        </Descriptions.Item>
        <Descriptions.Item label="分类">
          {blogData.blog_category_name}
        </Descriptions.Item>
        <Descriptions.Item label="标签">
          {
            (blogData?.tags || []).map((item: any) => (
              <Tag title={item.name} color='default'>{tags.find(t => parseInt(t.id) === parseInt(item))?.name}</Tag>
            ))
          }
        </Descriptions.Item>
        <Descriptions.Item label="描述">
          {data.description}
        </Descriptions.Item>
        <Descriptions.Item label="状态">
          <Tag color={blogData.publish  ? 'green' : 'red'}>{blogData.publish ? '发布' : '草稿'}</Tag>
        </Descriptions.Item>
        <Descriptions.Item label="创建时间">
          {data.createTime}
        </Descriptions.Item>
        <Descriptions.Item label="更新时间">
          {data.updateTime}
        </Descriptions.Item>
      </Descriptions>
      <div className={styles.content}>
        <MarkdownEditor value={data.content} readOnly />
      </div>
    </Modal>
  );
};

export default ModalWrapper<IProps>(BlogViewModal);
