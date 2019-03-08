using System;

namespace Mercurius.Prime.Boot.Web
{
	// Token: 0x02000006 RID: 6
	[Serializable]
	public class SessionItem
	{
		// Token: 0x17000005 RID: 5
		// (get) Token: 0x06000017 RID: 23 RVA: 0x0000241D File Offset: 0x0000061D
		// (set) Token: 0x06000018 RID: 24 RVA: 0x00002425 File Offset: 0x00000625
		public DateTime CreatedAt { get; set; }

		// Token: 0x17000006 RID: 6
		// (get) Token: 0x06000019 RID: 25 RVA: 0x0000242E File Offset: 0x0000062E
		// (set) Token: 0x0600001A RID: 26 RVA: 0x00002436 File Offset: 0x00000636
		public DateTime LockDate { get; set; }

		// Token: 0x17000007 RID: 7
		// (get) Token: 0x0600001B RID: 27 RVA: 0x0000243F File Offset: 0x0000063F
		// (set) Token: 0x0600001C RID: 28 RVA: 0x00002447 File Offset: 0x00000647
		public int LockID { get; set; }

		// Token: 0x17000008 RID: 8
		// (get) Token: 0x0600001D RID: 29 RVA: 0x00002450 File Offset: 0x00000650
		// (set) Token: 0x0600001E RID: 30 RVA: 0x00002458 File Offset: 0x00000658
		public int Timeout { get; set; }

		// Token: 0x17000009 RID: 9
		// (get) Token: 0x0600001F RID: 31 RVA: 0x00002461 File Offset: 0x00000661
		// (set) Token: 0x06000020 RID: 32 RVA: 0x00002469 File Offset: 0x00000669
		public bool Locked { get; set; }

		// Token: 0x1700000A RID: 10
		// (get) Token: 0x06000021 RID: 33 RVA: 0x00002472 File Offset: 0x00000672
		// (set) Token: 0x06000022 RID: 34 RVA: 0x0000247A File Offset: 0x0000067A
		public string SessionItems { get; set; }

		// Token: 0x1700000B RID: 11
		// (get) Token: 0x06000023 RID: 35 RVA: 0x00002483 File Offset: 0x00000683
		// (set) Token: 0x06000024 RID: 36 RVA: 0x0000248B File Offset: 0x0000068B
		public int Flags { get; set; }
	}
}
