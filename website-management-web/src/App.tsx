import React from 'react';

import BlogManagement from '@/Pages/BlogManagement';

import styles from './index.module.less';

const App = () => {

  return (
    <div className={styles.blogManagement}>
      <BlogManagement />
    </div>
  )
}

export default App;