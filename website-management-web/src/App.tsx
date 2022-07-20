import React from 'react';
import { Tabs } from 'antd';

import BlogManagement from '@/Pages/BlogManagement';

import styles from './index.module.less';

const { TabPane } = Tabs;

const App = () => {
  return (
    <div className={styles.blogManagement}>
      <Tabs>
        <TabPane tab="内容管理" key="1">
          <BlogManagement />
        </TabPane>
        <TabPane tab="标签管理" key="2">
          标签管理
        </TabPane>
      </Tabs>
    </div>
  )
}

export default App;