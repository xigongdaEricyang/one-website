import React, { useEffect, useMemo, useState } from 'react';
import { Button, Steps } from 'antd';

import { asyncFetchWorkflows, asyncListWorkflowRuns, asyncTriggerPublish } from '@/request';
import { Workflow } from '@/interfaces';

import styles from './index.module.less';

interface Props {

}

const { Step } = Steps;

function PublishManagement(props: Props) {

  const [workflows, setWorkflows] = useState<Workflow[]>([]);

  const currentWorkflow = useMemo<Workflow>(() => {
    const workflow = workflows.find(w => w.name === 'Deploy Website Manually');
    return workflow!
  }, [workflows])

  const [curStep, setCurStep] = useState<number>(0);

  useEffect(() => {
    asyncFetchWorkflows().then(res => {
      setWorkflows(res);
    });
  }, [])

  const handlePublish = async () => {
    if (currentWorkflow) {
      const res = await asyncTriggerPublish(currentWorkflow.id, {
        ref: 'master',
        inputs: {
          language: "ZH",
          environment: "nebula-website-test"
        }
      })
      // setInterval(async () => {
      //   const res = await asyncListWorkflowRuns(currentWorkflow.id);
      //   console.log('res', res);
      // }, 2000)

      const runners = await asyncListWorkflowRuns(currentWorkflow.id);
      console.log('res', runners);
    }
  }

  return (
    <div className={styles.publishManagement}>
      <Button type='primary' onClick={handlePublish}>
        发布预发
      </Button>
      {/* {
        curStep > 0 && (
          
        )
      } */}
      {/* <div className={styles.stepContent}>
        <Steps>
          <Step title="开始" description="正在部署预发" />
          <Step title="完成" description="正在部署预发" />
        </Steps>
      </div> */}
    </div>
  )
}

export default PublishManagement;