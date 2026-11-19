export type Role = "learner" | "editor" | "reviewer" | "admin" | "super_admin";
export type TestCode = "TWK" | "TIU" | "TKP";
export type ContentStatus = "draft" | "in_review" | "published" | "archived";
export type Difficulty = "easy" | "medium" | "hard";

export type Profile = {
  id: string;
  full_name: string | null;
  phone: string | null;
  role: Role;
  target: "cpns" | "kedinasan" | null;
  formation_type: string;
  passing_grade_profile_id: string | null;
  exam_date: string | null;
  daily_study_minutes: number | null;
  onboarded: boolean;
  suspended: boolean;
  font_scale: number;
  created_at: string;
};

export type PassingGradeProfile = {
  id: string;
  name: string;
  year: number;
  formation_type: string;
  rule_type: "per_test" | "cumulative";
  twk_min: number | null;
  tiu_min: number | null;
  tkp_min: number | null;
  total_min: number | null;
  is_default: boolean;
  notes: string | null;
};

export type Topic = { id: string; test_code: TestCode; name: string; slug: string; description: string | null; sort_order: number };
export type Subtopic = { id: string; topic_id: string; name: string; slug: string; sort_order: number };

export type Lesson = {
  id: string;
  subtopic_id: string;
  title: string;
  slug: string;
  summary: string | null;
  content: string;
  video_url: string | null;
  pdf_url: string | null;
  is_free: boolean;
  sort_order: number;
  est_minutes: number;
  status: ContentStatus;
  reviewer_note: string | null;
  updated_at: string;
};

export type QuestionOption = { label: "A" | "B" | "C" | "D" | "E"; text: string; points?: number };

export type Question = {
  id: string;
  test_code: TestCode;
  subtopic_id: string | null;
  stem: string;
  image_url: string | null;
  options: QuestionOption[];
  explanation: string;
  difficulty: Difficulty;
  usage: "practice" | "tryout" | "both";
  source: string | null;
  year: number | null;
  status: ContentStatus;
  reviewer_note: string | null;
  version: number;
  parent_id: string | null;
  created_at: string;
  updated_at: string;
};

export type Tryout = {
  id: string;
  title: string;
  slug: string;
  description: string | null;
  kind: "scheduled" | "on_demand";
  starts_at: string | null;
  ends_at: string | null;
  cap_at_window_end: boolean;
  duration_minutes: number;
  extended_duration_minutes: number | null;
  attempt_limit: number | null;
  blueprint: Record<TestCode, number>;
  shuffle_questions: boolean;
  shuffle_options: boolean;
  discussion_after: "submit" | "window_close";
  is_free: boolean;
  passing_grade_profile_id: string | null;
  status: ContentStatus;
};

export type Thresholds = {
  profile: string;
  rule: "per_test" | "cumulative";
  twk: number | null;
  tiu: number | null;
  tkp: number | null;
  total: number | null;
  max_twk: number;
  max_tiu: number;
  max_tkp: number;
};

export type Attempt = {
  id: string;
  tryout_id: string;
  user_id: string;
  attempt_no: number;
  started_at: string;
  deadline: string;
  submitted_at: string | null;
  auto_submitted: boolean;
  twk_score: number | null;
  tiu_score: number | null;
  tkp_score: number | null;
  total_score: number | null;
  passed: boolean | null;
  thresholds: Thresholds | null;
  formation_type: string | null;
  tab_switches: number;
};

export type Package = {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  price: number;
  duration_days: number | null;
  until_date: string | null;
  includes_material: boolean;
  includes_practice: boolean;
  includes_all_tryouts: boolean;
  features: string[];
  highlight: boolean;
  is_active: boolean;
  sort_order: number;
};

export type Transaction = {
  id: string;
  order_code: string;
  user_id: string;
  package_id: string;
  base_amount: number;
  discount_amount: number;
  amount: number;
  status: "pending" | "paid" | "failed" | "expired" | "refunded";
  gateway: string;
  gateway_ref: string | null;
  payment_url: string | null;
  payment_method: string | null;
  paid_at: string | null;
  created_at: string;
};

export const TESTS: { code: TestCode; name: string; short: string; questions: number; max: number }[] = [
  { code: "TWK", name: "Tes Wawasan Kebangsaan", short: "Wawasan Kebangsaan", questions: 30, max: 150 },
  { code: "TIU", name: "Tes Intelegensia Umum", short: "Intelegensia Umum", questions: 35, max: 175 },
  { code: "TKP", name: "Tes Karakteristik Pribadi", short: "Karakteristik Pribadi", questions: 45, max: 225 },
];

export const FORMATIONS: { value: string; label: string }[] = [
  { value: "umum", label: "Umum" },
  { value: "cumlaude", label: "Lulusan Cumlaude" },
  { value: "diaspora", label: "Diaspora" },
  { value: "disabilitas", label: "Penyandang Disabilitas" },
  { value: "papua", label: "Putra/Putri Papua" },
  { value: "kalimantan", label: "Putra/Putri Kalimantan" },
];

export const ROLE_LABEL: Record<Role, string> = {
  learner: "Peserta",
  editor: "Content Editor",
  reviewer: "Reviewer",
  admin: "Admin",
  super_admin: "Super Admin",
};

export const STATUS_LABEL: Record<ContentStatus, string> = {
  draft: "Draft",
  in_review: "Dalam review",
  published: "Terbit",
  archived: "Diarsipkan",
};
