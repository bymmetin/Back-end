import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class QuestionsService {
  constructor(private supabase: SupabaseService) {}

  async getQuestions(lessonId: string) {
    const { data, error } = await this.supabase
      .getClient()
      .from('questions')
      .select('*')
      .eq('lesson_id', lessonId);

    if (error) throw new Error(error.message);
    return data;
  }
}
