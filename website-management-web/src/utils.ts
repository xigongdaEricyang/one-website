import dayjs from "dayjs";

export enum Language {
  ZH_CN = 'zh_CN',
  EN_US = 'en_US',
}

export const curLanguage = document.querySelector('html')?.lang as Language || Language.ZH_CN;

export const isEn = curLanguage === Language.EN_US;

export const formatDay = (date: string) => {
  return dayjs(date).format('YYYY-MM-DD HH:mm:ss');
}
