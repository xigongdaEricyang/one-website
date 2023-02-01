import React from 'react';
import './index.scss';
import { PluginProps } from '@alilc/lowcode-types';

export interface IProps {
  logo?: string;
  href?: string;
}

const Logo: React.FC<IProps & PluginProps> = (props): React.ReactElement => {
  return (
    <div className="lowcode-plugin-logo">
      <a className="logo" target="blank" href={'https://vesoft.com/'} style={{ backgroundImage: `url(https://vesoft-cdn.nebula-graph.com.cn/vesoft-website/images/vesoft-logo.png)` }} />
    </div>
  );
};

export default Logo;
