import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class ProgressService {
  constructor(private supabase: SupabaseService) {}

  async getUserProgress(userId: string) {
    const { data, error } = await this.supabase
      .getClient()
      .from('user_progress')
      .select('*, lessons(title, topic_id)')
      .eq('user_id', userId);

    if (error) throw new Error(error.message);
    return data;
  }

  async saveProgress(userId: string, lessonId: string, score: number, xpEarned: number) {
    const client = this.supabase.getClient();

    const { error: upsertError } = await client
      .from('user_progress')
      .upsert(
        { user_id: userId, lesson_id: lessonId, completed: true, score },
        { onConflict: 'user_id,lesson_id' },
      );

    if (upsertError) throw new Error(upsertError.message);

    const { data: profile } = await client
      .from('profiles')
      .select('xp')
      .eq('id', userId)
      .single();

    const currentXp = profile?.xp ?? 0;
    await client
      .from('profiles')
      .update({ xp: currentXp + xpEarned })
      .eq('id', userId);

    return { success: true };
  }
}
