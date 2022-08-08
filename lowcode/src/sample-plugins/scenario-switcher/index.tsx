import React, { useEffect, useState } from 'react';
import { ILowCodePluginContext } from '@alilc/lowcode-engine';
import { Select, Divider, Button, Dialog, Input, Message } from '@alifd/next';
// import scenarios from '../../universal/scenarios';
const { Option } = Select;

const getCurrentScenarioName = () => {
  // return 'index'
  // const list = location.href.split('/');
  // return list[list.length - 1].replace('.html', '');
  return new URLSearchParams(location.search.slice(1)).get('scenario') || 'lowcode_index';
};

let name = '';

function Switcher(props: any) {
  const [scenarios, setScenarios] = useState([]);

  const getInitValue = async () => {
    const res = await fetch(`http://192.168.8.116/hackthon/list`).then((r) => r.json());
    const scenarios = res.data.map((i) => i.dict_key);
    setScenarios(scenarios);
  };

  useEffect(() => {
    getInitValue();
  }, []);

  return (
    <Select
      id="basic-demo"
      onChange={(val) => (location.href = `/?scenario=${val}`)}
      defaultValue={getCurrentScenarioName()}
      style={{ width: 220 }}
      placeholder="请选择应用"
      menuProps={{
        footer: (
          <div style={{ padding: '0 4px', textAlign: 'center' }}>
            <Divider style={{ marginBottom: 0, marginTop: 4 }} />
            <Button
              text
              type="primary"
              onClick={() =>
                Dialog.show({
                  v2: true,
                  title: '新增应用',
                  content: (
                    <Input
                      size="large"
                      placeholder="填写应用ID"
                      onChange={(v) => (name = v)}
                      aria-label="Large"
                    />
                  ),
                  style: {
                    width: 500,
                  },
                  onOk: async () => {
                    await fetch('http://192.168.8.116/hackthon/write', {
                      method: 'POST',
                      body: JSON.stringify({ key: `lowcode_${name}`, value: '{}' }),
                      headers: { 'Content-Type': 'application/json' },
                    });
                    Message.success('创建成功');
                    location.href = `/?scenario=lowcode_${name}`
                  },
                })
              }
            >
              新增应用
            </Button>
          </div>
        ),
      }}
    >
      {scenarios.map((scenario: any) => (
        <Option value={scenario}>{scenario}</Option>
      ))}
    </Select>
  );
}

export const scenarioSwitcher = (ctx: ILowCodePluginContext) => {
  return {
    name: 'scenarioSwitcher',
    async init() {
      const { skeleton } = ctx;

      skeleton.add({
        name: 'scenarioSwitcher',
        area: 'topArea',
        type: 'Widget',
        props: {
          align: 'right',
          width: 80,
        },
        content: Switcher,
      });
    },
  };
};
scenarioSwitcher.pluginName = 'scenarioSwitcher';
