import { themes as prismThemes } from "prism-react-renderer";
import type { Config } from "@docusaurus/types";
import type * as Preset from "@docusaurus/preset-classic";

// NECD OS config, adapted from aurora-docs (Apache-2.0).
const config: Config = {
  title: "NECD OS",
  tagline: "NECD OS Documentation",
  favicon: "img/necd-logo.svg",

  url: "https://northeast-childrens-dentistry.github.io",
  baseUrl: "/necdos-docs/",

  future: {
    v4: true,
  },

  organizationName: "Northeast-Childrens-Dentistry",
  projectName: "necdos-docs",

  // Excluded upstream pages leave dangling links; don't fail the build over them.
  onBrokenLinks: "warn",
  onBrokenMarkdownLinks: "warn",

  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  presets: [
    [
      "classic",
      {
        docs: {
          sidebarPath: "./sidebars.ts",
          routeBasePath: "/",
          editUrl: "https://github.com/Northeast-Childrens-Dentistry/necdos-docs",
        },
        theme: {
          customCss: "./src/css/custom.css",
        },
        blog: false,
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    navbar: {
      title: "NECD OS",
      logo: {
        alt: "NECD OS Logo",
        src: "img/necd-logo.svg",
      },
      items: [
        {
          type: "docSidebar",
          sidebarId: "baseSidebar",
          position: "left",
          label: "Documentation",
        },
        {
          href: "https://github.com/Northeast-Childrens-Dentistry/necdos",
          label: "GitHub",
          position: "right",
        },
      ],
    },
    footer: {
      style: "dark",
      copyright: `Based on the Aurora documentation (Apache-2.0), modified by NECD. Copyright © ${new Date().getFullYear()} Northeast Children's Dentistry and Universal Blue.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
