export interface Workflow {
  id: number;
  node_id: string;
  name: string;
  path: string;
  state: 'active' | 'disabled_manually';
  badge_url: string;
  created_at: string;
  html_url: string;
  updated_at: string;
  url: string;
}