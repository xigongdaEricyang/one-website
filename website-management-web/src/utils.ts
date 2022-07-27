export enum Language {
  ZH_CN = 'zh_CN',
  EN_US = 'en_US',
}

export const curLanguage = document.querySelector('html')?.lang as Language || Language.ZH_CN;
