import React from 'react';
import { createRoot } from 'react-dom/client';

import PublishManagement from '@/Pages/PublishManagement';
import styles from './index.module.less';

const App = () => {
  return (
    <div className={styles.blogManagement}>
      <PublishManagement />
    </div>
  )
}

const container = document.getElementById('app');
const root = createRoot(container); // createRoot(container!) if you use TypeScript
root.render(<App />);