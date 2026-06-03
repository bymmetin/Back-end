import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class LessonsService {
  constructor(private supabase: SupabaseService) {}

  async getLessons(topicId: string) {
    const { data, error } = await this.supabase
      .getClient()
      .from('lessons')
      .select('*')
      .eq('topic_id', topicId)
      .order('order_num', { ascending: true });

    if (error) throw new Error(error.message);
    return data;
  }
}
