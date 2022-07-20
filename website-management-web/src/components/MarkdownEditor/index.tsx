// import react, react-markdown-editor-lite, and a markdown parser you like
import React from 'react';
import MarkdownIt from 'markdown-it';
import MdEditor from 'react-markdown-editor-lite';
// import style manually
import 'react-markdown-editor-lite/lib/index.css';

// Initialize a markdown parser
const mdParser = new MarkdownIt(/* Markdown-it options */);

interface Props {
  value?: string;
  onChange?: (value) => void;
  readOnly?: boolean;
}

const MarkdownEditor = (props: Props) => {
  const{ value, onChange, readOnly } = props;
  const handleEditorChange = ({ html, text }) => {
    onChange?.(text);
  }

  return (
    <MdEditor readOnly={readOnly} value={value} style={{ width: '100%', height: '500px' }} renderHTML={text => mdParser.render(text)} onChange={handleEditorChange} />
  );
};

export default MarkdownEditor;